import React, { useEffect, useState } from 'react';
import { ScrollView, StyleSheet, Text, TouchableOpacity, View } from 'react-native';
import { Dropdown } from 'react-native-element-dropdown';
import { RadioButton } from 'react-native-paper';

function PerfScreen({ navigation }) {

    let table = ["un", "deux", "trois"]; 

    //Radio Buttons
    const [courChecked, setCourChecked] = React.useState('un');
    const [resultChecked, setResultChecked] = React.useState('moy');

    const renderRadio = () => {

        const radioItems = [];

        for (let i = 0; i < 3; i++) {
            radioItems.push(
                <View style={styles.checkContainer} key={i}>
                    <View style={styles.checkContent}>
                        <RadioButton 
                            value="first"
                            status={ courChecked === table[i] ? 'checked' : 'unchecked' }
                            onPress={() => setCourChecked(table[i])}
                            color="#3d88ec"
                        />
                        <Text style={styles.titleContent}>PROG1297</Text>
                    </View>
                    <Text style={styles.descContent}>Programmation Web PHP et Ajax</Text>
                </View>
            );
        }

        return radioItems;
    }

    //Drop Down List
    const data = [
        { label: 'Printemps 2024', value: '1' },
        { label: 'Hiver 2024', value: '2' },
        { label: 'Automne 2023', value: '3' },
        { label: 'Printemps 2023', value: '4' },
    ];

    const [value, setValue] = useState(null);
    const [isFocus, setIsFocus] = useState(false);

    return (
        <View style={styles.container}>
            <Text style={styles.perfTitle}>Ma performance</Text>

            <Text style={styles.guideText}>Veuillez effectuer votre choix.</Text>
            <View style={styles.sessionContainer}>
                <Text style={styles.contLabel}>Session</Text>
                <Dropdown
                    style={[styles.dropdown, isFocus && { borderColor: 'blue' }]}
                    placeholderStyle={styles.placeholderStyle}
                    selectedTextStyle={styles.selectedTextStyle}
                    inputSearchStyle={styles.inputSearchStyle}
                    data={data}
                    labelField="label"
                    valueField="value"
                    placeholder={!isFocus ? 'Select item' : '...'}
                    searchPlaceholder="Search..."
                    value={value}
                    onFocus={() => setIsFocus(true)}
                    onBlur={() => setIsFocus(false)}
                    onChange={item => {
                        setValue(item.value);
                        setIsFocus(false);
                    }}
                />
            </View>
            <View style={styles.resultContainer}>
                <Text style={styles.contLabel}>Résultats</Text>
                {/*rework with radiobutton.item*/}
                <RadioButton.Group onValueChange={resultChecked => setResultChecked(resultChecked)} value={resultChecked}>
                    <RadioButton.Item 
                        label="Moyenne generale" 
                        value="moy" 
                        color="#3d88ec"
                        uncheckedColor="#3d88ec"
                        style={styles.resultRadioButtons}
                        
                    />
                    <RadioButton.Item 
                        label="Note d'evaluation" 
                        value="note"
                        color="#3d88ec"
                        uncheckedColor="#3d88ec"
                        style={styles.resultRadioButtons} 
                    />
                </RadioButton.Group>

            </View>

            {resultChecked != 'moy' ?(
            <View style={styles.coursContainer}>
                <Text style={styles.contLabel}>Cours</Text>
                <ScrollView horizontal>
                    {renderRadio()}        
                </ScrollView>
            </View>
            ) : (
            <View style={styles.coursContainer}></View>    
            )}
            <TouchableOpacity style={styles.submitButton} onPress={() => navigation.navigate('PerfInfo', {id: courChecked, mode: resultChecked})}>
                <Text style={styles.submitText}>OK</Text>
            </TouchableOpacity>
        </View>
    );
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: '#E0E0E0',
        alignItems: 'center',
        justifyContent: 'flex-end',
    },
    perfTitle: {
        position: 'absolute',
        top: 50,
        alignItems: 'center',
        fontSize: 40,
        fontWeight: 'bold',
    },
    guideText: {
        position: 'absolute',
        top: 140,
        left: 25,
        alignItems: 'center',
        fontSize: 20,
    },
    //use for all text at start of containers
    contLabel: {
        fontSize: 20,
        fontWeight: 'bold',
        marginLeft: 20,
        marginTop: 5,
    },
    sessionContainer: {
        backgroundColor: '#B0B0B0',
        width: '90%',
        height: 220,
        borderRadius: 5,
        position: 'absolute',
        top: 170,
    },
    dropdown: {
        width: '90%',
        height: 50,
        borderColor: 'gray',
        backgroundColor: 'white',
        borderWidth: 2,
        borderRadius: 8,
        paddingHorizontal: 8,
        marginLeft: 17,
        marginTop: 10
    },
    placeholderStyle: {
        fontSize: 16,
    },
      selectedTextStyle: {
        fontSize: 16,
    },
    inputSearchStyle: {
        height: 40,
        fontSize: 16,
    },
    resultContainer: {
        backgroundColor: '#B0B0B0',
        width: '90%',
        height: 140,
        borderRadius: 5,
        position: 'absolute',
        top: 400,
    },
    resultRadioButtons: {
        marginVertical: 0.5,
        borderRadius: 5,
        borderWidth: 2,
        borderColor: '#3d88ec',
        backgroundColor: '#77b7f3',
    },
    buttonText: {
        fontSize: 20,
        fontWeight: 'bold',
        textAlign: 'center',
    },
    coursContainer: {
        backgroundColor: '#B0B0B0',
        width: '90%',
        height: 150,
        borderRadius: 5,
        position: 'absolute',
        top: 550,
    },
    checkContainer: {
        marginLeft: 5
    },
    checkContent: {
        flexDirection: 'row',
        alignItems: 'center',
    },
    titleContent: {
        fontWeight: 'bold',
        fontSize: 17,
    },
    descContent: {
        marginLeft: 40,
        width: 70,
        fontSize: 10,
    },
    submitButton: {
        backgroundColor: '#3d88ec',
        width: '90%',
        height: 40,
        borderRadius: 5,
        alignItems: 'center',
        justifyContent: 'center',
        position: 'absolute',
        top: 710,
    },
    submitText: {
        color: 'white',
        fontSize: 20,
        fontWeight: 'bold'
    }
    
})

export default PerfScreen;